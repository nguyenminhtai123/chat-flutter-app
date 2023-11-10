class MeModel {
  final String firstname;
  final String lastname;
  final String avatar;
  final String city;
  final String relationship;
  final String gender;
  final String jobTitle;
  final String jobArea;
  final bool story;
  final String status;
  final List<String> stories;

  MeModel({
    required this.firstname,
    required this.lastname,
    required this.avatar,
    required this.city,
    required this.relationship,
    required this.gender,
    required this.jobTitle,
    required this.jobArea,
    required this.story,
    required this.status,
    required this.stories,
  });

  factory MeModel.fromJson(Map<String, dynamic> data) => MeModel(
      firstname: data['firstname'],
      lastname: data['lastname'],
      avatar: data['avatar'],
      city: data['city'],
      relationship: data['relationship'],
      gender: data['gender'],
      jobTitle: data['job_title'],
      jobArea: data['job_area'],
      story: data['story'],
      status: data['status'],
      stories: List.from(data['stories']));
}
