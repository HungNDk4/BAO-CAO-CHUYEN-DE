@echo off
chcp 65001 >nul
echo ========================================================
echo    DỰ ÁN BÁO CÁO CHUYÊN ĐỀ - SHOP NƯỚC HOA (BAGISTO)
echo ========================================================
echo.
echo [1/3] Kiem tra cau hinh moi truong (.env)...
if not exist .env (
    copy .env.example .env
    call php artisan key:generate
    echo     -^> Da tao moi tep .env va sinh APP_KEY.
) else (
    echo     -^> Tep .env da ton tai.
)

echo.
echo [2/3] Dong bo kho tai nguyen anh (storage -^> public/storage)...
if exist public\storage (
    rmdir /s /q public\storage 2>nul
    del /f /q public\storage 2>nul
)
mkdir public\storage 2>nul
xcopy /E /I /Y /Q storage\app\public\* public\storage\ >nul
echo     -^> Da sao chep toan bo hinh anh sang public/storage.

echo.
echo [3/3] Don sach bo nho dem he thong (optimize:clear)...
call php artisan optimize:clear

echo.
echo ========================================================
echo   THIET LAP HOAN TAT THANH CONG!
echo   Khoi chay may chu noi bo: php artisan serve
echo   - Storefront (Khach hang) : http://127.0.0.1:8000
echo   - Admin Panel (Quan tri)  : http://127.0.0.1:8000/admin
echo     (Tai khoan: admin@example.com / admin123)
echo ========================================================
echo.
pause
