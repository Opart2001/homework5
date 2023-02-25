class Project {
  final String title; // ชื่อโครงการขอรับบริจาค
  final String description; // คำอธิบายเกี่ยวกับโครงการ
  final int targetAmount; // ยอดเงินขอรับบริจาคที่ต้องการ
  final int duration; // ระยะเวลาโครงการ
  final int receiveAmount; // จำนวนเงินที่ได้รับบริจาคมาแล้ว
  final int donateCount; // จำนวนครั้งที่บริจาคเข้ามา
  final String imageURL;
  final String detail;
  final String time;
  final String place;

  Project({
    required this.title,
    required this.description,
    required this.targetAmount,
    required this.duration,
    required this.receiveAmount,
    required this.donateCount,
    required this.imageURL,
    required this.detail,
    required this.time,
    required this.place,
  });
}