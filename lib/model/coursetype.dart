class CourseTypeModel {
    CourseTypeModel({
        required this.data,
    });

    final List<Datum> data;

    factory CourseTypeModel.fromJson(Map<String, dynamic> json){ 
        return CourseTypeModel(
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        );
    }

}

class Datum {
    Datum({
        required this.id,
        required this.title,
        required this.image,
    });

    final int? id;
    final String? title;
    final String? image;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            id: json["id"],
            title: json["title"],
            image: json["image"],
        );
    }

}
