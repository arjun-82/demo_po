import 'package:arjun_portfolio/presentation/widget/custom_textfield.dart';
import 'package:arjun_portfolio/service/portfolio_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class UploadPortfolioPage extends StatefulWidget {
  const UploadPortfolioPage({super.key});

  @override
  UploadPortfolioPageState createState() => UploadPortfolioPageState();
}

class UploadPortfolioPageState extends State<UploadPortfolioPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _xController = TextEditingController();
  final TextEditingController _cvUrlController = TextEditingController();
  final TextEditingController _skillTitleController = TextEditingController();
  final TextEditingController _skillDescriptionController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _projectDescriptionController = TextEditingController();
  final TextEditingController _projectTechController = TextEditingController();
  final TextEditingController _projectRepoController = TextEditingController();

  File? _skillImage;
  File? _projectImage;

  Future<void> _pickImage(ImageSource source, bool isSkillImage) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isSkillImage) {
          _skillImage = File(pickedFile.path);
        } else {
          _projectImage = File(pickedFile.path);
        }
      });
    }
  }

  Future<String?> _uploadImage(File image, String path) async {
    try {
      final ref = _storage.ref().child(path);
      await ref.putFile(image);
      return await ref.getDownloadURL();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> _uploadPortfolio() async {
    String? skillImageUrl;
    String? projectImageUrl;

    if (_skillImage != null) {
      skillImageUrl = await _uploadImage(_skillImage!, 'skills/${_skillTitleController.text}.jpg');
    }

    if (_projectImage != null) {
      projectImageUrl = await _uploadImage(_projectImage!, 'projects/${_projectNameController.text}.jpg');
    }

    PortfolioModel portfolio = PortfolioModel(
      personalInfo: PersonalInfo(
        name: _nameController.text,
        title: _titleController.text,
        about: _aboutController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        linkedin: _linkedinController.text,
        github: _githubController.text,
        whatsapp: _whatsappController.text,
        instagram: _instagramController.text,
        x: _xController.text,
        cvUrl: _cvUrlController.text,
      ),
      skills: [
        Skill(
          title: _skillTitleController.text,
          description: _skillDescriptionController.text,
          imageUrl: skillImageUrl,
        ),
      ],
      experience: [
        Experience(
          company: _companyController.text,
          location: _locationController.text,
          role: _roleController.text,
          startDate: DateTime.tryParse(_startDateController.text),
          endDate: _endDateController.text,
          responsibilities: ["Worked on various projects"],
        )
      ],
      projects: [
        Project(
          name: _projectNameController.text,
          description: _projectDescriptionController.text,
          technologies: _projectTechController.text.split(','),
          repository: _projectRepoController.text,
          imageUrl: projectImageUrl,
        ),
      ],
    );

    try {
      await _firestore.collection('portfolios').add(portfolio.toJson());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Portfolio uploaded successfully!")),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to upload: $e")),
        );
      }
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Portfolio")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(controller: _nameController, hint: "Enter Name", label: "Name"),
              CustomTextField(controller: _titleController, hint: "Enter Title", label: "Title"),
              CustomTextField(controller: _aboutController, hint: "Enter About", label: "About"),
              CustomTextField(controller: _emailController, hint: "Enter Email", label: "Email"),
              CustomTextField(controller: _phoneController, hint: "Enter Phone", label: "Phone"),
              CustomTextField(controller: _linkedinController, hint: "Enter LinkedIn", label: "LinkedIn"),
              CustomTextField(controller: _githubController, hint: "Enter GitHub", label: "GitHub"),
              CustomTextField(controller: _whatsappController, hint: "Enter WhatsApp", label: "WhatsApp"),
              CustomTextField(controller: _instagramController, hint: "Enter Instagram", label: "Instagram"),
              CustomTextField(controller: _xController, hint: "Enter X (Twitter)", label: "X (Twitter)"),
              CustomTextField(controller: _cvUrlController, hint: "Enter CV URL", label: "CV URL"),
              const Divider(),
              CustomTextField(controller: _skillTitleController, hint: "Enter Skill Title", label: "Skill Title"),
              CustomTextField(controller: _skillDescriptionController, hint: "Enter Skill Description", label: "Skill Description"),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery, true),
                child: const Text("Pick Skill Image"),
              ),
              const Divider(),
              CustomTextField(controller: _companyController, hint: "Enter Company", label: "Company"),
              CustomTextField(controller: _locationController, hint: "Enter Location", label: "Location"),
              CustomTextField(controller: _roleController, hint: "Enter Role", label: "Role"),
              CustomTextField(controller: _startDateController, hint: "Enter Start Date (YYYY-MM-DD)", label: "Start Date (YYYY-MM-DD)"),
              CustomTextField(controller: _endDateController, hint: "Enter End Date", label: "End Date"),
              const Divider(),
              CustomTextField(controller: _projectNameController, hint: "Enter Project Name", label: "Project Name"),
              CustomTextField(controller: _projectDescriptionController, hint: "Enter Project Description", label: "Project Description"),
              CustomTextField(controller: _projectTechController, hint: "Enter Technologies (comma-separated)", label: "Technologies (comma-separated)"),
              CustomTextField(controller: _projectRepoController, hint: "Enter Project Repository", label: "Project Repository"),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery, false),
                child: const Text("Pick Project Image"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadPortfolio,
                child: const Text("Upload"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
