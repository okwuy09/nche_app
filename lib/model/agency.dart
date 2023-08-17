class Agency {
  final String id;
  final String agencyName;
  final String agencyAddress;
  final String agencyLogo;
  final List? agencyPhone;
  Agency({
    required this.id,
    required this.agencyName,
    required this.agencyAddress,
    required this.agencyLogo,
    this.agencyPhone,
  });
}
