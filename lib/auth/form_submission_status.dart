abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitalFormStatus extends FormSubmissionStatus {
  const InitalFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class SubmitSuccess extends FormSubmissionStatus {}

class SubmitFailed extends FormSubmissionStatus {
  final Exception exception;
  SubmitFailed(this.exception);
}
