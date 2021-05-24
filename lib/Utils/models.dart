/// Created by Usman Akhlaq on 19.02.2021

class Parent {
  ///Parent Data
  String parentID;
  String name;
  String relation;
  String fatherName;
  String motherName;
  String occupation;
  String income;
  String education;
  String email;
  String phone;
  String address;
  String city;
  String state;
  String branchID;
  String parentImageURL;
  String facebookURL;
  String linkedinURL;
  String twitterURL;
  String createdAt;
  String updatedAt;
  String active;
  String roleID;
  String userName;
  String loginID;
  String role;

  Parent.fromJSON(Map json)
      : this.parentID = json['id'],
        this.name = json['name'],
        this.relation = json['relation'],
        this.fatherName = json['father_name'],
        this.motherName = json['mother_name'],
        this.occupation = json['occupation'],
        this.income = json['income'],
        this.education = json['education'],
        this.email = json['email'],
        this.phone = json['mobileno'],
        this.address = json['address'],
        this.city = json['city'],
        this.state = json['state'],
        this.branchID = json['branch_id'],
        this.parentImageURL = json['phone'],
        this.facebookURL = json['facebook_url'],
        this.linkedinURL = json['linkedin_url'],
        this.twitterURL = json['twitter_url'],
        this.createdAt = json['created_at'],
        this.updatedAt = json['updated_at'],
        this.active = json['active'],
        this.roleID = json['role_id'],
        this.userName = json['username'],
        this.loginID = json['login_id'],
        this.role = json['role'];
}

class Children {
  ///Child Data
  String childID;
  String childImageURL;
  String childUserName;
  String childSection;
  String childClass;

  Children.fromJSON(Map json)
      : this.childID = json['id'],
        this.childImageURL = json['photo'],
        this.childSection = json['section_name'],
        this.childClass = json['class_name'],
        this.childUserName = json['fullname'];
}

class Child {
  String id;
  String registerNo;
  String admissionDate;
  String firstName;
  String lastName;
  String gender;
  String birthday;
  String religion;
  String caste;
  String bloodGroup;
  String motherTongue;
  String currentAddress;
  String permanentAddress;
  String city;
  String state;
  String mobileNo;
  String categoryID;
  String email;
  String parentID;
  String routeID;
  String vehicleID;
  String hostelID;
  String roomID;
  String previousDetails;
  String imageURL;
  String createdAt;
  String updatedAt;
  String userName;
  String active;
  String classID;
  String sectionID;
  String enrollID;
  String role;
  String branchID;
  String sessionID;
  String className;
  String sectionName;
  String categoryName;

  Child.fromJSON(Map json)
      : this.id = json['id'],
        this.registerNo = json['register_no'],
        this.admissionDate = json['admission_date'],
        this.firstName = json['first_name'],
        this.lastName = json['last_name'],
        this.gender = json['gender'],
        this.birthday = json['birthday'],
        this.religion = json['religion'],
        this.caste = json['caste'],
        this.bloodGroup = json['blood_group'],
        this.motherTongue = json['mother_tongue'],
        this.currentAddress = json['current_address'],
        this.permanentAddress = json['permanent_address'],
        this.city = json['city'],
        this.state = json['state'],
        this.mobileNo = json['mobileno'],
        this.categoryID = json['category_id'],
        this.email = json['email'],
        this.parentID = json['parent_id'],
        this.routeID = json['route_id'],
        this.vehicleID = json['vehicle_id'],
        this.hostelID = json['hostel_id'],
        this.roomID = json['room_id'],
        this.previousDetails = json['previous_details'],
        this.imageURL = json['photo'],
        this.createdAt = json['created_at'],
        this.updatedAt = json['updated_at'],
        this.userName = json['username'],
        this.active = json['active'],
        this.classID = json['class_id'],
        this.sectionID = json['section_id'],
        this.enrollID = json['enrollid'],
        this.role = json['roll'],
        this.branchID = json['branch_id'],
        this.sessionID = json['session_id'],
        this.className = json['class_name'],
        this.sectionName = json['section_name'],
        this.categoryName = json['category_name'];
}

class StudentAttendance {
  int present;
  int absent;
  int late;
  int hospital;

  StudentAttendance(this.present, this.absent, this.late, this.hospital);
}

class AttendanceHistory {
  String status;
  String remarks;
  String date;
  String creationDate;
  String creationTime;

  AttendanceHistory.fromJSON(Map json)
      : this.status = json['status'],
        this.remarks = json['remark'],
        this.date = json['attendance_date'],
        this.creationDate = json['creation_date'],
        this.creationTime = json['creation_time'];
}

class Voucher {
  String name;
  String amount;
  String discount;
  String balance;
  String dueDate;

  Voucher.fromJSON(Map json)
      : this.name = json['name'],
        this.dueDate = json['due_date'],
        this.amount = json['amount'],
        this.discount = json['type_discount'],
        this.balance = json['balance'];
}

class Diary {
  String id;
  String classID;
  String sectionID;
  String sessionID;
  String subjectID;
  String homeworkDate;
  String submissionDate;
  String description;
  String createdBy;
  String createdDate;
  String status;
  String smsNotification;
  String scheduleDate;
  String document;
  String evaluatedBy;
  String evaluationDate;
  String branchID;
  String subjectName;
  String className;
  String sectionName;
  String creatorName;
  String documentPath;

  Diary.fromJSON(Map json)
      : this.id = json['id'],
        this.classID = json['class_id'],
        this.sectionID = json['section_id'],
        this.sessionID = json['session_id'],
        this.subjectID = json['subject_id'],
        this.homeworkDate = json['date_of_homework'],
        this.submissionDate = json['date_of_submission'],
        this.description = json['description'],
        this.createdBy = json['created_by'],
        this.createdDate = json['created_date'],
        this.status = json['status'],
        this.smsNotification = json['sms_notification'],
        this.scheduleDate = json['schedule_date'],
        this.document = json['document'],
        this.evaluationDate = json['evaluation_date'],
        this.evaluatedBy = json['evaluated_by'],
        this.branchID = json['branch_id'],
        this.subjectName = json['subject_name'],
        this.className = json['class_name'],
        this.sectionName = json['section_name'],
        this.creatorName = json['creator_name'],
        this.documentPath = json['document_path'];
}

class StudentEvents {
  String id;
  String title;
  String remark;
  String status;
  String type;
  String audition;
  String selectedList;
  String startDate;
  String endDate;
  String image;
  String createdBy;
  String createdAt;
  String updatedAt;
  String branchId;
  String showWeb;
  String imagePath;

  StudentEvents.fromJSON(Map json)
      : this.id = json['id'],
        this.title = json['title'],
        this.remark = json['remark'],
        this.status = json['status'],
        this.type = json['type'],
        this.audition = json['audition'],
        this.selectedList = json['selected_list'],
        this.startDate = json['start_date'],
        this.endDate = json['end_date'],
        this.image = json['image'],
        this.createdBy = json['created_by'],
        this.createdAt = json['created_at'],
        this.updatedAt = json['updated_at'],
        this.branchId = json['branch_id'],
        this.showWeb = json['show_web'],
        this.imagePath = json['image_path'];
}

class ExamSchedule {
  String id;
  String examId;
  String classId;
  String sectionId;
  String subjectId;
  String timeStart;
  String timeEnd;
  String hallId;
  String examDate;
  String branchId;
  String sessionId;
  String createdAt;
  String updatedAt;
  String branchName;
  String fullMark;
  String passMark;
  String examName;
  String className;
  String sectionName;
  String hallName;

  ExamSchedule.fromJSON(Map json)
      : this.id = json['id'],
        this.examId = json['exam_id'],
        this.classId = json['class_id'],
        this.sectionId = json['section_id'],
        this.subjectId = json['subject_id'],
        this.timeStart = json['time_start'],
        this.timeEnd = json['time_end'],
        this.hallId = json['hall_id'],
        this.examDate = json['exam_date'],
        this.branchId = json['branch_id'],
        this.sessionId = json['session_id'],
        this.createdAt = json['created_at'],
        this.updatedAt = json['updated_at'],
        this.branchName = json['branch_name'],
        this.fullMark = json['full_mar'],
        this.passMark = json['pass_mark'],
        this.examName = json['exam_name'],
        this.sectionName = json['section_name'],
        this.hallName = json['hall_name'];
}
