#!/bin/sh

echo "🎵 [1/2] Đang khởi động MP3 API trên port 5555..."
cd /app/mp3-api
# Chạy ngầm tiến trình mp3-api bằng dấu &
if [ -f "index.js" ]; then
    node index.js &
elif [ -f "server.js" ]; then
    node server.js &
else
    npm start &
fi

echo "🚀 [2/2] Đang khởi động Xiaozhi Adapter trên port 5005..."
cd /app/adapter
# Trỏ thẳng URL API về localhost bên trong container
export MP3_API_URL=http://localhost:5555
export PORT=5005
export NODE_ENV=production

# Chạy tiến trình chính và giữ container luôn sống
node xiaozhi-adapter.js