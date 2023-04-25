package fa.tranning.sondt21_jwd_assignment_03.util;

import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;

import java.util.Set;

public class ValidatorUtil {
    private ValidatorUtil() {
    }

    public static <T> Set<ConstraintViolation<T>> validate(T entity) {
        try (ValidatorFactory factory = Validation.buildDefaultValidatorFactory()) {
            Validator validator = factory.getValidator();

            return validator.validate(entity);
        }
    }
}
