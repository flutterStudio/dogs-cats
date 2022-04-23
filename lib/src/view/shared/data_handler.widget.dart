import 'package:flutter/material.dart';
import 'package:flutter_template/src/model/data.model.dart';
import 'package:flutter_template/src/utils/extensions.dart';
import 'package:get/get.dart';

/// the main widget when [Data] status is succeed.
typedef OnSucess<T> = Widget Function(BuildContext, T data);

/// [RequestHandler] show widgets due to the [Data] object status.
/// [stream]] accepts [Stream] of [Future<Data>], [stream] is required.
/// [mainContent] is the main widget that you want to handle requests from.
/// [onSuccess] is the main widget when [Data] status is succeed, [onSuccess] is required.
/// [onFailed] is thw widget that appears when [Data] status is failed, [onFailed] has a default widget.
/// [inProgress] is the widget that appears when the [Data] status is in-progress, [inProgress] has a default value.
/// [isDismissible] is a boolean variable that indicates if you want user to
/// dismiss messages that shows upon the [mainContent] or not.
/// [other] is the widget that appears when the [Data] status is not one of the previous statuses, [other] has a default value.
class DataHandler<T> extends StatelessWidget {
  final Data<T> _data;
  final OnSucess<T> _onSuccess;
  final Widget Function(String? error)? _onFailed;
  final Widget? _inProgress;
  final Widget? _other;
  final Widget Function(BuildContext)? _onEmpty;
  final VoidCallback? onErrorRetry;

  const DataHandler(
      {Key? key,
      required OnSucess<T> onSuccess,
      Widget Function(String? error)? onFailed,
      Widget Function(BuildContext)? onEmpty,
      inProgress,
      other,
      required Data<T> data,
      this.onErrorRetry})
      : _onSuccess = onSuccess,
        _onFailed = onFailed,
        _onEmpty = onEmpty,
        _inProgress = inProgress,
        _other = other,
        _data = data,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _contentBuilder(context),
    );
  }

  Widget _contentBuilder(BuildContext context) {
    switch (_data.status) {
      case DataStatus.inProgress:
        {
          return _inProgress ??
              CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primaryVariant,
              );
        }
      case DataStatus.faild:
        {
          return _onFailed != null
              ? _onFailed!(_data.message)
              : _errorWidget(
                  context,
                  _data.message ?? "error-unknown".tr,
                );
        }
      case DataStatus.succeed:
        {
          if (_data.data.isNullOrEmpty()) {
            return _onEmpty != null
                ? _onEmpty!(context)
                : _emptyResponseWidget(context, "error-empty".tr);
          } else {
            return _onSuccess(context, _data.data!);
          }
        }
      case DataStatus.empty:
        {
          return _onEmpty != null
              ? _onEmpty!(context)
              : _emptyResponseWidget(context, "error-empty".tr);
        }
      default:
        {
          return _other ?? Container();
        }
    }
  }

  Widget _errorWidget(BuildContext context, String message) {
    return Column(
      children: [
        const Spacer(),
        Expanded(
          child: Column(
            children: [
              Icon(Icons.error_outline, color: Theme.of(context).primaryColor),
              const SizedBox(height: 15),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 15),
              onErrorRetry == null
                  ? Container()
                  : TextButton(
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primaryVariant,
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .primary, // Background Color
                      ),
                      onPressed: onErrorRetry,
                      child: Text(
                        "try-again".tr,
                        style: Theme.of(context).textTheme.button,
                      ))
            ],
          ),
        ),
      ],
    );
  }

  Widget _emptyResponseWidget(BuildContext context, String message) {
    return Column(
      children: [
        Icon(Icons.error_outline, color: Theme.of(context).primaryColor),
        const SizedBox(height: 15),
        Text(
          message,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        const SizedBox(height: 15),
        onErrorRetry == null
            ? Container()
            : TextButton(onPressed: onErrorRetry, child: Text("try-again".tr))
      ],
    );
  }
}
