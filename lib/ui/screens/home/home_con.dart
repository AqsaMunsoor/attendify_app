part of 'home_bin.dart';

enum FetchStatus { initial, loading, success, error }

class HomeCon extends GetxController {
  final fetchStatus = FetchStatus.initial.obs;

  final _allRecords = <AttendanceRecordModel>[].obs;

  final activeFilter = AttendanceStatus.all.obs;

  final filteredRecords = <AttendanceRecordModel>[].obs;

  bool get isLoading => fetchStatus.value == FetchStatus.loading;
  bool get hasError => fetchStatus.value == FetchStatus.error;

  final _imagePicker = ImagePicker();
  final _imageCropper = ImageCropper();

  final pickedImage = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchAttendance();
  }

  Future<void> fetchAttendance() async {
    try {
      fetchStatus.value = FetchStatus.loading;

      final records = await _getMockAttendanceData();
      _allRecords.assignAll(records);

      _applyFilter();

      fetchStatus.value = FetchStatus.success;
    } catch (e) {
      fetchStatus.value = FetchStatus.error;
      Get.snackbar('Error', 'Failed to load attendance data.');
    }
  }

  void filterChanged(AttendanceStatus newFilter) {
    activeFilter.value = newFilter;
    _applyFilter();
  }

  void _applyFilter() {
    if (activeFilter.value == AttendanceStatus.all) {
      filteredRecords.assignAll(_allRecords);
    } else {
      final filtered =
          _allRecords
              .where((record) => record.status == activeFilter.value)
              .toList();
      filteredRecords.assignAll(filtered);
    }
  }

  Future<List<AttendanceRecordModel>> _getMockAttendanceData() async {
    await Future.delayed(const Duration(milliseconds: 800));
    final random = Random();
    const uuid = Uuid();

    final possibleStatuses = [
      AttendanceStatus.present,
      AttendanceStatus.absent,
      AttendanceStatus.late,
    ];

    return List.generate(15, (index) {
      return AttendanceRecordModel(
        id: uuid.v4(),
        date: DateTime.now().subtract(Duration(days: index)),
        status: possibleStatuses[random.nextInt(possibleStatuses.length)],
      );
    });
  }

  void showImageSourceDialog() {
    Get.defaultDialog(
      title: "Choose Image Source",
      titleStyle: AppText.h4.copyWith(
        color: AppColors.neutral,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: AppColors.white900,
      radius: 12,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(
              HugeIcons.strokeRoundedImage01,
              color: AppColors.primary,
            ),
            title: Text(
              'Gallery',
              style: AppText.bodyMedium.copyWith(color: AppColors.neutral700),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onTap: () {
              Get.back();
              _pickAndCropImage(ImageSource.gallery);
            },
          ),
          const Divider(height: 0, color: AppColors.white300),
          ListTile(
            leading: Icon(
              HugeIcons.strokeRoundedCamera01,
              color: AppColors.primary,
            ),
            title: Text(
              'Camera',
              style: AppText.bodyMedium.copyWith(color: AppColors.neutral700),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onTap: () {
              Get.back();
              _pickAndCropImage(ImageSource.camera);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickAndCropImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(source: source);
      if (pickedFile == null) {
        Get.snackbar('Cancelled', 'Image picking was cancelled.');
        return;
      }

      final CroppedFile? croppedFile = await _cropImage(pickedFile.path);
      if (croppedFile == null) {
        Get.snackbar('Cancelled', 'Image cropping was cancelled.');
        return;
      }

      Get.toNamed(AppRoutes.result, arguments: croppedFile.path);
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  Future<CroppedFile?> _cropImage(String filePath) async {
    return await _imageCropper.cropImage(
      sourcePath: filePath,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
          ],
        ),
      ],
    );
  }
}
