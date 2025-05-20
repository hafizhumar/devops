# Gunakan base image resmi Node.js
FROM node:18

# Tentukan direktori kerja di dalam container
WORKDIR /app

# Salin file package.json dan package-lock.json (jika ada)
COPY package*.json ./

# Install dependency
RUN npm install

# Salin semua file ke dalam container
COPY . .

# Buka port aplikasi (ubah sesuai port di app.js, default: 3000)
EXPOSE 3000

# Jalankan aplikasi
CMD ["node", "app.js"]