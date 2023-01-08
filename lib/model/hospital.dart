class Hospital {
  final String id;
  final String name;
  final String address;
  final String phone;
  final Availabel_beds available_beds;

  Hospital({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.available_beds,
  });
}

class Availabel_beds {
  final int availabel;
  final String bed_class;
  final String room_name;
  final String info;

  Availabel_beds({
    required this.availabel,
    required this.bed_class,
    required this.room_name,
    required this.info,
  });
}
