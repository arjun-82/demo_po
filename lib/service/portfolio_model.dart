// import 'dart:convert';

// PortfolioModel portfolioModelFromJson(String str) => PortfolioModel.fromJson(json.decode(str));

// String portfolioModelToJson(PortfolioModel data) => json.encode(data.toJson());

// class PortfolioModel {
//     PersonalInfo? personalInfo;
//     List<Skill>? skills;
//     List<Experience>? experience;
//     List<Project>? projects;

//     PortfolioModel({
//         this.personalInfo,
//         this.skills,
//         this.experience,
//         this.projects,
//     });

//     factory PortfolioModel.fromJson(Map<String, dynamic> json) => PortfolioModel(
//         personalInfo: json["personal_info"] == null ? null : PersonalInfo.fromJson(json["personal_info"]),
//         skills: json["skills"] == null ? [] : List<Skill>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
//         experience: json["experience"] == null ? [] : List<Experience>.from(json["experience"]!.map((x) => Experience.fromJson(x))),
//         projects: json["projects"] == null ? [] : List<Project>.from(json["projects"]!.map((x) => Project.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "personal_info": personalInfo?.toJson(),
//         "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x.toJson())),
//         "experience": experience == null ? [] : List<dynamic>.from(experience!.map((x) => x.toJson())),
//         "projects": projects == null ? [] : List<dynamic>.from(projects!.map((x) => x.toJson())),
//     };
// }

// class Experience {
//     String? company;
//     String? location;
//     String? role;
//     DateTime? startDate;
//     String? endDate;
//     String? url;
//     List<String>? responsibilities;

//     Experience({
//         this.company,
//         this.location,
//         this.role,
//         this.startDate,
//         this.endDate,
//         this.url,
//         this.responsibilities,
//     });

//     factory Experience.fromJson(Map<String, dynamic> json) => Experience(
//         company: json["company"],
//         location: json["location"],
//         role: json["role"],
//         startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
//         endDate: json["end_date"],
//         url: json["url"],
//         responsibilities: json["responsibilities"] == null ? [] : List<String>.from(json["responsibilities"]!.map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "company": company,
//         "location": location,
//         "role": role,
//         "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
//         "end_date": endDate,
//         "url": url,
//         "responsibilities": responsibilities == null ? [] : List<dynamic>.from(responsibilities!.map((x) => x)),
//     };
// }

// class PersonalInfo {
//     String? name;
//     String? title;
//     String? about;
//     String? email;
//     String? phone;
//     String? linkedin;
//     String? github;
//     String? whatsapp;
//     String? instagram;
//     String? x;
//     String? cvUrl;

//     PersonalInfo({
//         this.name,
//         this.title,
//         this.about,
//         this.email,
//         this.phone,
//         this.linkedin,
//         this.github,
//         this.whatsapp,
//         this.instagram,
//         this.x,
//         this.cvUrl,
//     });

//     factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
//         name: json["name"],
//         title: json["title"],
//         about: json["about"],
//         email: json["email"],
//         phone: json["phone"],
//         linkedin: json["linkedin"],
//         github: json["github"],
//         whatsapp: json["whatsapp"],
//         instagram: json["instagram"],
//         x: json["x"],
//         cvUrl: json["cv_url"],
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "title": title,
//         "about": about,
//         "email": email,
//         "phone": phone,
//         "linkedin": linkedin,
//         "github": github,
//         "whatsapp": whatsapp,
//         "instagram": instagram,
//         "x": x,
//         "cv_url": cvUrl,
//     };
// }

// class Project {
//     String? name;
//     String? imageUrl;
//     String? description;
//     List<String>? technologies;
//     String? repository;

//     Project({
//         this.name,
//         this.imageUrl,
//         this.description,
//         this.technologies,
//         this.repository,
//     });

//     factory Project.fromJson(Map<String, dynamic> json) => Project(
//         name: json["name"],
//         imageUrl: json["image_url"],
//         description: json["description"],
//         technologies: json["technologies"] == null ? [] : List<String>.from(json["technologies"]!.map((x) => x)),
//         repository: json["repository"],
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "image_url": imageUrl,
//         "description": description,
//         "technologies": technologies == null ? [] : List<dynamic>.from(technologies!.map((x) => x)),
//         "repository": repository,
//     };
// }

// class Skill {
//     String? imageUrl;
//     String? title;
//     String? description;
//     String? webUrl;

//     Skill({
//         this.imageUrl,
//         this.title,
//         this.description,
//         this.webUrl,
//     });

//     factory Skill.fromJson(Map<String, dynamic> json) => Skill(
//         imageUrl: json["imageUrl"],
//         title: json["title"],
//         description: json["description"],
//         webUrl: json["web_url"],
//     );

//     Map<String, dynamic> toJson() => {
//         "imageUrl": imageUrl,
//         "title": title,
//         "description": description,
//         "web_url": webUrl,
//     };
// }
import 'dart:convert';

// Convert JSON string to PortfolioModel object
PortfolioModel portfolioModelFromJson(String str) =>
    PortfolioModel.fromJson(json.decode(str));

// Convert PortfolioModel object to JSON string
String portfolioModelToJson(PortfolioModel data) => json.encode(data.toJson());

class PortfolioModel {
  PersonalInfo? personalInfo;
  List<Skill>? skills;
  List<Experience>? experience;
  List<Project>? projects;

  PortfolioModel({
    this.personalInfo,
    this.skills,
    this.experience,
    this.projects,
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) => PortfolioModel(
        personalInfo: json["personal_info"] == null
            ? null
            : PersonalInfo.fromJson(json["personal_info"]),
        skills: (json["skills"] as List<dynamic>?)
            ?.map((x) => Skill.fromJson(x))
            .toList(),
        experience: (json["experience"] as List<dynamic>?)
            ?.map((x) => Experience.fromJson(x))
            .toList(),
        projects: (json["projects"] as List<dynamic>?)
            ?.map((x) => Project.fromJson(x))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "personal_info": personalInfo?.toJson(),
        "skills": skills?.map((x) => x.toJson()).toList(),
        "experience": experience?.map((x) => x.toJson()).toList(),
        "projects": projects?.map((x) => x.toJson()).toList(),
      };
}

class Experience {
  String? company;
  String? location;
  String? role;
  DateTime? startDate;
  String? endDate;
  String? url;
  List<String>? responsibilities;

  Experience({
    this.company,
    this.location,
    this.role,
    this.startDate,
    this.endDate,
    this.url,
    this.responsibilities,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        company: json["company"],
        location: json["location"],
        role: json["role"],
        startDate: _parseDate(json["start_date"]),
        endDate: json["end_date"],
        url: json["url"],
        responsibilities: (json["responsibilities"] as List<dynamic>?)
            ?.map((x) => x.toString())
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "company": company,
        "location": location,
        "role": role,
        "start_date": startDate,
        "end_date": endDate,
        "url": url,
        "responsibilities": responsibilities,
      };

  // Safe date parsing function to avoid errors
  static DateTime? _parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      return null; // Return null if parsing fails
    }
  }
}

class PersonalInfo {
  String? name;
  String? title;
  String? about;
  String? email;
  String? phone;
  String? linkedin;
  String? github;
  String? whatsapp;
  String? instagram;
  String? x;
  String? cvUrl;

  PersonalInfo({
    this.name,
    this.title,
    this.about,
    this.email,
    this.phone,
    this.linkedin,
    this.github,
    this.whatsapp,
    this.instagram,
    this.x,
    this.cvUrl,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
        name: json["name"],
        title: json["title"],
        about: json["about"],
        email: json["email"],
        phone: json["phone"],
        linkedin: json["linkedin"],
        github: json["github"],
        whatsapp: json["whatsapp"],
        instagram: json["instagram"],
        x: json["x"],
        cvUrl: json["cv_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "about": about,
        "email": email,
        "phone": phone,
        "linkedin": linkedin,
        "github": github,
        "whatsapp": whatsapp,
        "instagram": instagram,
        "x": x,
        "cv_url": cvUrl,
      };
}

class Project {
  String? name;
  String? imageUrl;
  String? description;
  List<String>? technologies;
  String? repository;

  Project({
    this.name,
    this.imageUrl,
    this.description,
    this.technologies,
    this.repository,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        name: json["name"],
        imageUrl: json["image_url"],
        description: json["description"],
        technologies: (json["technologies"] as List<dynamic>?)
            ?.map((x) => x.toString())
            .toList(),
        repository: json["repository"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image_url": imageUrl,
        "description": description,
        "technologies": technologies,
        "repository": repository,
      };
}

class Skill {
  String? imageUrl;
  String? title;
  String? description;
  String? webUrl;

  Skill({
    this.imageUrl,
    this.title,
    this.description,
    this.webUrl,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        imageUrl: json["imageUrl"],
        title: json["title"],
        description: json["description"],
        webUrl: json["web_url"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "title": title,
        "description": description,
        "web_url": webUrl,
      };
}
