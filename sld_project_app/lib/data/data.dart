import 'package:flutter/cupertino.dart';
import 'package:sld_project_app/model/speciality.dart';

List<SpecialityModel> getSpeciality() {
  List<SpecialityModel> specialities = [];
  SpecialityModel specialityModel = new SpecialityModel();

  //1
  specialityModel.description = "description 1";
  specialityModel.speciality = "Checklist for Parents";
  specialityModel.imgAssetPath = "assets/img1.png";
  specialityModel.backgroundColor = Color(0xffFBB97C);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //2
  specialityModel.description = "description 2";
  specialityModel.speciality = "Checklist for Teachers";
  specialityModel.imgAssetPath = "assets/img2.png";
  specialityModel.backgroundColor = Color(0xffF69383);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //3
  //3
  specialityModel.description = "description 3";
  specialityModel.speciality =
      "General Information about Specific Learning Disabilities";
  specialityModel.imgAssetPath = "assets/img3.png";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  return specialities;
}
