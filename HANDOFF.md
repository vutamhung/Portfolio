# Bàn giao: Portfolio Video Editor – Vũ Tam Hưng

> Cập nhật: 13/10/2026. Dán link repo này vào chat mới và nói "Tiếp tục dự án portfolio này".

## Link

| | |
|---|---|
| Trang công khai (GitHub Pages) | https://vutamhung.github.io/Portfolio/ |
| Mã nguồn (nơi lưu chính) | https://github.com/vutamhung/Portfolio, nhánh `main` |
| Bản trên claude.ai (riêng tư) | https://claude.ai/artifact/W5W3Tj4qmZUh9De6gCP2cq |
| Video gốc chất lượng cao | Google Drive của Hưng: các thư mục Phim ngắn, TikTok, YouTube, Recap |

## Cách sửa và cập nhật

1. Lấy về máy: `git clone https://github.com/vutamhung/Portfolio.git "D:\WEB Portlilio"`
2. Sửa `index.html` (một file chứa toàn bộ HTML/CSS/JS, ảnh chân dung hero và mục Học tập nhúng base64).
3. Nháy đúp `Cap nhat GitHub.bat`: script tự tìm media mà trang dùng, viết lại `.gitignore`, commit và push. GitHub Pages cập nhật sau khoảng 1 phút.
4. Muốn trang claude.ai đổi theo thì nhờ Claude publish lại vào link artifact ở trên (bản publish lấy từ chính `index.html`).

## Cấu trúc trang

1. **Hero:** "Mình là *Tam Hưng*, Video Editor", câu tuyên ngôn về "nhịp thở của câu chuyện", ảnh đen trắng đã tách nền trên vòng tròn xanh **#3D69E3** (màu phẳng, 3 lớp halo cùng màu nhạt dần, không có chữ chạy vòng), 6 ô phần mềm 3D lơ lửng.
2. **Kinh nghiệm:** timeline kiểu Premiere với BNC Group, Gein Academy, YUM Network; "3+ năm" (giữ đúng con số Hưng muốn).
3. **Học tập & làm việc:** hai dòng thời gian riêng, freelance cho các kênh nước hoa.
4. **Dịch vụ:** 4 thẻ dùng ảnh stock Unsplash (`media/sv/s-*.webp`) trên cùng một nền tối động; mô tả ngắn: TikTok/Reels, YouTube, Quảng cáo, Recap.
5. **Dự án:** 4 thẻ cùng nền tối động; video phát trong hộp thoại ngay trên trang. Mỗi video chỉ phát **1 phần** (video dài lấy phần đầu `*-p1.mp4`).
   - Phim ngắn: Bộ tứ 10A8, Resident
   - TikTok: Nutri Kids, TNG – Cú chuyển mình kỳ lân, YUM Network 2025
   - YouTube: Kiên Fragrance, Vita Perfume, Phim ngắn Gein Academy
   - Recap: Sinh nhật Elite, Tổng kết IVF Bưu Điện, Tổng kết năm 2024 (YUM x Sunphaco)
6. **Liên hệ:** khung nền gradient tối, tiêu đề "Câu chuyện của bạn, *nhịp dựng của mình.*", câu "Cảm ơn các bạn đã đọc, hi vọng sớm được hợp tác!", ảnh chân dung tách nền trồi lên khỏi mép trên bên phải (mép áo khớp mép phải khung), thẻ liên hệ kính mờ.

Hiệu ứng chung: nền trang trắng ngà có quầng màu và hạt mịn; chữ gradient ở các cụm key; 5 hình phim ảnh mờ (parallax theo tốc độ cuộn); ánh sáng gradient theo con trỏ và chữ phóng nhẹ khi rê chuột (chỉ trên máy có chuột); mọi hoạt ảnh tắt khi bật giảm chuyển động.

## Thêm hoặc đổi video

- Danh sách video nằm trong object `VIDEOS` ở cuối `index.html`: `{ id, file?, title, sub, dur, parts }`. Video phát `media/<file|id>.mp4`, poster là `media/<id>.webp`.
- Nén bằng ffmpeg: H.264 2-pass, 480p (video dọc rộng 540–720), khoảng 450–1300 kbps tuỳ độ dài, mỗi file nên dưới 15 MB (giới hạn của claude.ai; GitHub nhận tới 100 MB).
- Bản claude.ai giới hạn 256 MB mỗi version (hiện dùng khoảng 126 MB), không dùng capability `assets` vì nó chặn chia sẻ công khai.

## Thông tin cá nhân

Vũ Tam Hưng, Video Editor tại Hà Nội · 0903 536 296 · vutamhung@gmail.com · fb.com/hunghailua96

## Quyết định đã thống nhất

- Không dùng logo chính thức của Adobe/CapCut/DaVinci; icon tự thiết kế kèm tên.
- Không lặp thông tin giữa các mục; giọng văn thực tế, hướng tới khách nhưng có chất.
- Hoạt ảnh nhẹ, tinh tế.

## Việc có thể làm tiếp

- Mua tên miền riêng (vutamhung.com còn trống lúc kiểm tra) rồi trỏ về GitHub Pages: thêm file `CNAME`, 4 bản ghi A tới `185.199.108–111.153`, `www` CNAME tới `vutamhung.github.io`, bật Enforce HTTPS.
- Cắt highlight 2–3 phút hoặc nén lại nét hơn cho các video đang chỉ phát phần đầu.
- Còn chờ Hưng xác nhận: Freelance "2023 – 2025" hay "2023 – nay"; Motion graphic tự học hay học ở đâu; mô tả "Video nội bộ công ty" cho YUM Network 2025.
