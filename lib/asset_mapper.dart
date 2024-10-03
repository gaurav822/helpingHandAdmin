class AssetMapper {
  final String serviceName;
  late String assetPath;

  AssetMapper(this.serviceName) {
    assetPath = _serviceToAsset(serviceName);
  }

  String _serviceToAsset(String service) {
    switch (service) {
      case 'TFN':
        return 'assets/image/tfn.jpg';
      case 'ABN':
        return 'assets/image/abn.jpg';
      case 'Bank Setup':
        return 'assets/image/bank.jpg';
      case 'Police Check':
        return 'assets/image/police.jpg';
      case 'Jobs':
        return 'assets/image/job.jpg';
      case 'Accomodation':
        return 'assets/image/accomodation.jpg';
      default:
        return 'assets/image/job.jpg'; // Default case for unexpected values
    }
  }
}
