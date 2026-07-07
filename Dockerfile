FROM node:18-alpine

# Cài đặt bash và dos2unix để fix lỗi file Windows
RUN apk add --no-cache bash dos2unix

WORKDIR /app

# Copy toàn bộ mã nguồn vào container
COPY . .

# Chuẩn hóa định dạng file run.sh sang chuẩn Linux (LF)
RUN dos2unix run.sh

# Cài đặt dependencies cho gói mp3-api
RUN cd mp3-api && npm install --production

# Cài đặt dependencies cho gói adapter
RUN cd adapter && npm install --production

# Cấp quyền chạy cho script khởi động
RUN chmod +x run.sh

EXPOSE 5005 5555

CMD ["./run.sh"]