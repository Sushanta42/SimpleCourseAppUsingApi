class UpcomingModel {
    UpcomingModel({
        required this.data,
    });

    final List<Datum> data;

    factory UpcomingModel.fromJson(Map<String, dynamic> json){ 
        return UpcomingModel(
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        );
    }

}

class Datum {
    Datum({
        required this.id,
        required this.date,
        required this.time,
        required this.courseId,
        required this.image,
        required this.courseName,
        required this.classType,
        required this.duration,
        required this.status,
    });

    final int? id;
    final String? date;
    final String? time;
    final int? courseId;
    final String? image;
    final String? courseName;
    final String? classType;
    final String? duration;
    final bool? status;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            id: json["id"],
            date: json["date"],
            time: json["time"],
            courseId: json["course_id"],
            image: json["image"],
            courseName: json["course_name"],
            classType: json["class_type"],
            duration: json["duration"],
            status: json["status"],
        );
    }

}
