class CourseModel {
    CourseModel({
        required this.data,
    });

    final List<Datum> data;

    factory CourseModel.fromJson(Map<String, dynamic> json){ 
        return CourseModel(
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        );
    }

}

class Datum {
    Datum({
        required this.id,
        required this.courseName,
        required this.duration,
        required this.syllabus,
        required this.featured,
        required this.categoryId,
        required this.category,
        required this.similar,
    });

    final int? id;
    final String? courseName;
    final String? duration;
    final String? syllabus;
    final String? featured;
    final int? categoryId;
    final String? category;
    final List<Similar> similar;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            id: json["id"],
            courseName: json["course_name"],
            duration: json["duration"],
            syllabus: json["syllabus"],
            featured: json["featured"],
            categoryId: json["category_id"],
            category: json["category"],
            similar: json["similar"] == null ? [] : List<Similar>.from(json["similar"]!.map((x) => Similar.fromJson(x))),
        );
    }

}

class Similar {
    Similar({
        required this.id,
        required this.name,
        required this.slug,
        required this.duration,
        required this.fee,
        required this.syllabus,
        required this.featured,
        required this.views,
        required this.categoryId,
        required this.createdAt,
        required this.updatedAt,
    });

    final int? id;
    final String? name;
    final String? slug;
    final String? duration;
    final String? fee;
    final String? syllabus;
    final String? featured;
    final int? views;
    final int? categoryId;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    factory Similar.fromJson(Map<String, dynamic> json){ 
        return Similar(
            id: json["id"],
            name: json["name"],
            slug: json["slug"],
            duration: json["duration"],
            fee: json["fee"],
            syllabus: json["syllabus"],
            featured: json["featured"],
            views: json["views"],
            categoryId: json["category_id"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
        );
    }

}
