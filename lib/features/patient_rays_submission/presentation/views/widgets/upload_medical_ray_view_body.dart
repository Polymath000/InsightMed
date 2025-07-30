import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/entities/ray_entity.dart';
import '../../../../../core/helpers/custom_show_snackBar.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../cubit/upload_ray/upload_ray_cubit.dart';
import 'numeric_vitals.dart';
import 'symptoms.dart';
import 'upload_ray_image.dart';

class UploadMedicalRayViewBody extends StatefulWidget {
  const UploadMedicalRayViewBody({super.key, this.onChanged});
  final void Function(bool)? onChanged;

  @override
  State<UploadMedicalRayViewBody> createState() =>
      _UploadMedicalRayViewBodyState();
}

class _UploadMedicalRayViewBodyState extends State<UploadMedicalRayViewBody> {
  RayEntity _ray = const RayEntity();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final _formKey = GlobalKey<FormState>();

  String? _temperature;
  String? _systolicBP;
  String? _diastolicBP;
  String? _heartRate;
  bool? _canSmellTasteFood;
  bool? _hasCough;
  bool? _hasHeadache;

  @override
  Widget build(final BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 73),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: UploadRayImage(
                    onChangedImagePath: (final p0) {
                      setState(() {
                        _ray = _ray.copyWith(imagePath: p0);
                      });
                    },
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: NumericVitals(
                    onChangTemperature: (final p0) {
                      setState(() {
                        _temperature = p0;
                      });
                    },
                    onChangDiastolic: (final p0) {
                      setState(() {
                        _diastolicBP = p0;
                      });
                    },
                    onChangHeartRate: (final p0) {
                      setState(() {
                        _heartRate = p0;
                      });
                    },
                    onChangSystolic: (final p0) {
                      setState(() {
                        _systolicBP = p0;
                      });
                    },
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: Symptoms(
                    onChangCanSmell: (final p0) {
                      setState(() {
                        _canSmellTasteFood = p0;
                      });
                    },
                    onChangHasCough: (final p0) {
                      setState(() {
                        _hasCough = p0;
                      });
                    },
                    onChangHasHeadache: (final p0) {
                      setState(() {
                        _hasHeadache = p0;
                      });
                    },
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: CustomButton(
              onTap: () async {
                widget.onChanged!(true);
                if (_formKey.currentState!.validate() &&
                    !(_ray.imagePath == null || _ray.imagePath!.isEmpty)) {
                  _formKey.currentState!.save();
                  final composedRay = _ray.copyWith(
                    temperature: _temperature,
                    systolicBP: _systolicBP,
                    diastolicBP: _diastolicBP,
                    heartRate: _heartRate,
                    canSmellTasteFood: _canSmellTasteFood,
                    hasCough: _hasCough,
                    hasHeadache: _hasHeadache,
                  );
                  await BlocProvider.of<UploadRayCubit>(
                    context,
                  ).uploadRay(rayEntity: composedRay);
                  widget.onChanged!(false);
                } else if (_ray.imagePath == null || _ray.imagePath!.isEmpty) {
                  widget.onChanged!(false);
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                  customShowSnackBar(
                    context: context,
                    message: 'Cannot fetch the Rays.',
                  );
                } else {
                  widget.onChanged!(false);
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              btnText: 'Upload Medical Ray',
            ),
          ),
        ],
      ),
    ),
  );
}
