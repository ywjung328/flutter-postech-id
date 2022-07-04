enum Process {
  bachelor,
  master,
  doctor,
  postDoctor;

  String get toStr {
    switch (this) {
      case Process.bachelor:
        return "학사";
      case Process.master:
        return "석사";
      case Process.doctor:
        return "박사";
      case Process.postDoctor:
        return "포스트 닥터";
    }
  }
}

class Identification {
  Process process;
  String name;
  String major;
  int studentId;

  Identification(
      {this.process = Process.bachelor,
      required this.name,
      required this.major,
      required this.studentId});

  getProcess() => process;
  setProcess(Process process) => this.process = process;
  getName() => name;
  setName(String name) => this.name = name;
  getMajor() => major;
  setMajor(String major) => this.major = major;
  getId() => studentId;
  setId(int id) => studentId = id;
}
