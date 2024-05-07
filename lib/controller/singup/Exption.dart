class SignUpWithEmailAndPasswordFailure {
  final String message;
  SignUpWithEmailAndPasswordFailure(
      [this.message = 'An Unknown error occurred']);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak password':
        return SignUpWithEmailAndPasswordFailure('please enter your passwords');
      case 'invalid email':
        return SignUpWithEmailAndPasswordFailure(
            'Email is valid or badly formatted');
      case ' email already  in use':
        return SignUpWithEmailAndPasswordFailure(
            'An account already exists for that email');
      case 'opration not allwed':
        return SignUpWithEmailAndPasswordFailure(
            'Opration is not allowed please cantact support');
      case 'user disbled':
        return SignUpWithEmailAndPasswordFailure(
            'This user has been disabled. please contact support for help ');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
