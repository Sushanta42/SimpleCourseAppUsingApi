class PopularCourseModel {
    PopularCourseModel({
        required this.data,
    });

    final List<Datum> data;

    factory PopularCourseModel.fromJson(Map<String, dynamic> json){ 
        return PopularCourseModel(
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        );
    }

}

class Datum {
    Datum({
        required this.id,
        required this.name,
        required this.slug,
        required this.duration,
        required this.syllabus,
        required this.image,
        required this.views,
    });

    final int? id;
    final String? name;
    final String? slug;
    final String? duration;
    final String? syllabus;
    final String? image;
    final int? views;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            id: json["id"],
            name: json["name"],
            slug: json["slug"],
            duration: json["duration"],
            syllabus: json["syllabus"],
            image: json["image"],
            views: json["views"],
        );
    }

}
