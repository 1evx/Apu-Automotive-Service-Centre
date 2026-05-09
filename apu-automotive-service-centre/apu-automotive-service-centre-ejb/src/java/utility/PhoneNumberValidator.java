package utility;

import java.util.regex.Pattern;

public final class PhoneNumberValidator {

    private static final Pattern MALAYSIAN_PHONE_PATTERN =
            Pattern.compile("^01\\d{8,9}$");

    private PhoneNumberValidator() {
    }

    public static String normalizeMalaysianPhoneNumber(String phoneNumber) {
        if (phoneNumber == null) {
            return null;
        }

        return phoneNumber.replaceAll("\\D", "");
    }

    public static boolean isValidMalaysianPhoneNumber(String phoneNumber) {
        String normalizedPhoneNumber = normalizeMalaysianPhoneNumber(phoneNumber);
        return normalizedPhoneNumber != null
                && MALAYSIAN_PHONE_PATTERN.matcher(normalizedPhoneNumber).matches();
    }
}
