package utility;

import java.time.DateTimeException;
import java.time.LocalDate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class IcNumberValidator {

    private static final Pattern MALAYSIAN_IC_PATTERN =
            Pattern.compile("^(\\d{2})(\\d{2})(\\d{2})-(\\d{2})-(\\d{4})$");

    private IcNumberValidator() {
    }

    public static String normalizeMalaysianIc(String icNumber) {
        if (icNumber == null) {
            return null;
        }

        String digitsOnly = icNumber.replaceAll("\\D", "");
        if (digitsOnly.length() != 12) {
            return icNumber.trim();
        }

        return digitsOnly.substring(0, 6)
                + "-"
                + digitsOnly.substring(6, 8)
                + "-"
                + digitsOnly.substring(8, 12);
    }

    public static boolean isValidMalaysianIc(String icNumber) {
        String normalizedIc = normalizeMalaysianIc(icNumber);
        if (normalizedIc == null) {
            return false;
        }

        Matcher matcher = MALAYSIAN_IC_PATTERN.matcher(normalizedIc);
        if (!matcher.matches()) {
            return false;
        }

        int year = Integer.parseInt(matcher.group(1));
        int month = Integer.parseInt(matcher.group(2));
        int day = Integer.parseInt(matcher.group(3));

        return isValidBirthDate(1900 + year, month, day)
                || isValidBirthDate(2000 + year, month, day);
    }

    private static boolean isValidBirthDate(int year, int month, int day) {
        try {
            LocalDate birthDate = LocalDate.of(year, month, day);
            return !birthDate.isAfter(LocalDate.now());
        } catch (DateTimeException ex) {
            return false;
        }
    }
}
