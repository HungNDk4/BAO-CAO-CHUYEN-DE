<?php

declare(strict_types=1);

namespace App\Support;

use BaconQrCode\Renderer\Image\SvgImageBackEnd;
use BaconQrCode\Renderer\ImageRenderer;
use BaconQrCode\Renderer\RendererStyle\RendererStyle;
use BaconQrCode\Writer;

/**
 * Build EMVCo / VietQR (NAPAS 247) payloads and render offline SVG QR codes.
 */
final class VietQrPayload
{
    private const NAPAS_GUID = 'A000000727';

    private const SERVICE_TRANSFER_ACCOUNT = 'QRIBFTTA';

    /**
     * Build a VietQR EMVCo payload string with CRC16-CCITT checksum.
     */
    public static function build(
        string $bankBin,
        string $accountNumber,
        int $amountVnd,
        string $description
    ): string {
        $cleanBin = preg_replace('/\D+/', '', $bankBin) ?? '';
        $cleanAccount = preg_replace('/\s+/', '', $accountNumber) ?? '';
        $cleanDesc = substr((string) preg_replace('/[^A-Za-z0-9\-\s]/', '', $description), 0, 25);

        $bankInfo = self::tlv('00', $cleanBin).self::tlv('01', $cleanAccount);
        $merchantAccount = self::tlv('00', self::NAPAS_GUID)
            .self::tlv('01', $bankInfo)
            .self::tlv('02', self::SERVICE_TRANSFER_ACCOUNT);

        $payload = self::tlv('00', '01')
            .self::tlv('01', $amountVnd > 0 ? '12' : '11')
            .self::tlv('38', $merchantAccount)
            .self::tlv('53', '704');

        if ($amountVnd > 0) {
            $payload .= self::tlv('54', (string) $amountVnd);
        }

        $payload .= self::tlv('58', 'VN');

        if ($cleanDesc !== '') {
            $payload .= self::tlv('62', self::tlv('08', $cleanDesc));
        }

        $payload .= '6304';

        return $payload.self::crc16Ccitt($payload);
    }

    /**
     * Render a VietQR payload as an inline SVG string completely offline.
     */
    public static function toSvg(string $payload, int $size = 220): string
    {
        $renderer = new ImageRenderer(
            new RendererStyle($size, 1),
            new SvgImageBackEnd
        );

        return (new Writer($renderer))->writeString($payload);
    }

    /**
     * Compute uppercase 4-hex CRC16-CCITT (polynomial 0x1021, initial 0xFFFF).
     */
    public static function crc16Ccitt(string $data): string
    {
        $crc = 0xFFFF;
        $len = strlen($data);

        for ($i = 0; $i < $len; $i++) {
            $crc ^= (ord($data[$i]) << 8);
            for ($bit = 0; $bit < 8; $bit++) {
                if (($crc & 0x8000) !== 0) {
                    $crc = (($crc << 1) ^ 0x1021) & 0xFFFF;
                } else {
                    $crc = ($crc << 1) & 0xFFFF;
                }
            }
        }

        return strtoupper(str_pad(dechex($crc), 4, '0', STR_PAD_LEFT));
    }

    /**
     * Format an EMVCo Tag-Length-Value segment.
     */
    private static function tlv(string $tag, string $value): string
    {
        $length = str_pad((string) strlen($value), 2, '0', STR_PAD_LEFT);

        return $tag.$length.$value;
    }
}
