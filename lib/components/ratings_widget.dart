import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'ratings_model.dart';
export 'ratings_model.dart';

class RatingsWidget extends StatefulWidget {
  const RatingsWidget({
    super.key,
    this.parameter1,
  });

  final dynamic parameter1;

  @override
  State<RatingsWidget> createState() => _RatingsWidgetState();
}

class _RatingsWidgetState extends State<RatingsWidget> {
  late RatingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      onRatingUpdate: (newValue) =>
          safeSetState(() => _model.ratingBarValue = newValue),
      itemBuilder: (context, index) => Icon(
        Icons.star_rounded,
        color: FlutterFlowTheme.of(context).primary,
      ),
      direction: Axis.horizontal,
      initialRating: _model.ratingBarValue ??= widget.parameter1!,
      unratedColor: FlutterFlowTheme.of(context).alternate,
      itemCount: 5,
      itemSize: 24.0,
      glowColor: FlutterFlowTheme.of(context).primary,
    );
  }
}
