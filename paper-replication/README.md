# Software Security in Practice: Knowledge and Motivation

## Giới thiệu
Dự án tái lập một phần và mở rộng nghiên cứu từ bài báo:

**Software security in practice: knowledge and motivation**  
Hala Assal và cộng sự (2025), Journal of Cybersecurity.  
DOI: https://doi.org/10.1093/cybsec/tyaf005

## Mục tiêu
- Nghiên cứu phương pháp Grounded Theory trong phân tích dữ liệu phỏng vấn.
- Minh họa quy trình mã hóa Open Coding và Axial Coding.
- Phân tích các phương thức học tập của lập trình viên từ Stack Overflow Developer Survey 2024.
- Đối chiếu kết quả mở rộng với câu hỏi nghiên cứu RQ1.

## Phạm vi tái lập
Bài báo gốc sử dụng phỏng vấn 13 lập trình viên. Do không có bản ghi phỏng vấn gốc, dự án sử dụng dữ liệu mô phỏng để minh họa quy trình mã hóa.

Phần phân tích Stack Overflow Developer Survey 2024 sử dụng dữ liệu khảo sát thực tế, nhưng đo lường phương pháp học lập trình nói chung, không trực tiếp đo lường việc học bảo mật phần mềm.

Vì vậy, đây là tái lập một phần quy trình và thực nghiệm mở rộng, không phải tái lập đầy đủ kết quả nghiên cứu gốc.

## Công nghệ
- Ubuntu 24.04 / WSL2
- Bash
- Ruby
- Git

## Dữ liệu mở rộng
Stack Overflow Developer Survey 2024:
- Tổng số người tham gia: 65,437
- Lập trình viên chuyên nghiệp: 50,207
- Phản hồi LearnCode hợp lệ: 46,730

Dataset gốc không được lưu trong repository. Người sử dụng cần tải riêng và đặt tại replication/extension/dataset/.

## Chạy demo
```bash
bash scripts/run_demo.sh
```

## Kết quả tiêu biểu
- Tài nguyên trực tuyến: 82.01%
- Sách và tài liệu vật lý: 51.53%
- Khóa học trực tuyến / chứng chỉ: 50.66%
- Đào tạo tại nơi làm việc: 50.49%
- Học tại trường: 50.00%

Các tỷ lệ có thể cộng vượt 100% vì câu hỏi cho phép chọn nhiều đáp án.

## Cấu trúc dự án
- data/: dữ liệu mô phỏng và kết quả mã hóa
- docs/: tài liệu nghiên cứu và hướng dẫn
- replication/: codebook, tài liệu nguồn và phân tích mở rộng
- results/: kết quả thực nghiệm
- scripts/: script chạy demo

## Hạn chế
- Không có dữ liệu phỏng vấn gốc của 13 người tham gia.
- Không thể xác nhận tái lập đầy đủ các mã Grounded Theory của bài báo.
- Dữ liệu khảo sát Stack Overflow chỉ phù hợp với phân tích mở rộng gần RQ1.
- Không sử dụng khảo sát Stack Overflow để kết luận trực tiếp về động lực bảo mật RQ2.

## Tài liệu tham khảo
Assal, H., Morkonda, S. G., Arif, M. Z., & Chiasson, S. (2025). Software security in practice: knowledge and motivation. Journal of Cybersecurity. https://doi.org/10.1093/cybsec/tyaf005
