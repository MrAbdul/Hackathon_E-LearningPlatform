export enum Authority {
    Anon = 0,
    User = 1,
    Tutor = 2,
    Both = 3,
    Admin = 4,

}
export enum UserType {
    User = 0,
    Tutor = 1,
}
export enum MeetingType {
    Online = 1,
    InPerson = 2
}
export enum MeetingSize {
    Individual = 1,
    Group = 2,
    Both = 3
}
export enum Genders {
    male = 1,
    female = 0
}
export enum Errors {
    tutorProfileNotFound = "TUTOR_PROFILE_NOT_FOUND",
    userProfileNotFound = "USER_PROFILE_NOT_FOUND",
    unauthorized = "UNAUTHORIZED",
    unauthenticated = "UNAUTHENTICATED",
    resetPasswordCodeNotFound = "RESET_PASSWORD_NOT_FOUND",
    userNeedsToProvideTutorIdWhenCreatingASession = "USER_NEEDS_TO_PROVIDE_TUTOR_ID"
}
export enum ErrorSolutions {
    createProfileForUser = "create a profile for the user",
    createProfileForTutor = "create a profile for the tutor",
    userUnathorizedToUpdateTutorProfile = "user is unauthorized to update a tutors profile",
    wrongPasswordOrEmailCombo = "wrong password or Email Combo",
    resetPasswordCodeNotFound = "reset Password Code Not Found",
    userNeedsToProvideTutorIdWhenCreatingASession = "user needs to provide tutor id when creating a session",
    onlyATutorOrAUserCanCreateSessoins = "only A Tutor Or A User Can Create Sessoins"
}
export enum PostgressErrorCodes {
    //invalid
    invalid_text_representation = "22P02"

}
export enum Localization {
    ar = "ar",
    en = "en"
}