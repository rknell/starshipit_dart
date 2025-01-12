# AI Documentation Instructions

## Core Documentation Standards

1. Follow Dart documentation best practices
2. Ensure consistency between implementation and API documentation
3. Maintain high test coverage and follow existing test patterns
4. Document both how and why components are implemented

## API Method Documentation Structure

Each API method should be documented with:

1. A clear, concise description of what the method does
2. The HTTP method and endpoint path
3. Additional context about the operation where relevant
4. Required headers:
   - Content-Type: application/json
   - StarShipIT-Api-Key: API key from Settings > API > API Key
   - Ocp-Apim-Subscription-Key: Subscription key from Settings > API > Subscription key

5. Parameters section detailing:
   - All request model fields
   - Whether fields are required or optional
   - Field types and any constraints
   - Units of measurement where applicable (e.g., weight in kg, dimensions in m)

6. Returns section describing:
   - The response model and its fields
   - Field types and descriptions
   - Any special handling or conversion needed (e.g., base64 to PDF)

7. Error handling information:
   - The specific exception thrown
   - When/why errors might occur

## Model Documentation Standards

1. Use snake case field renaming globally in `build.yaml` instead of explicit `@JsonKey` annotations
2. Document all model fields with clear descriptions
3. Include units of measurement in field descriptions where applicable
4. Note any field constraints or validation requirements
5. Document relationships between models where relevant

## Code Organization

1. Keep API methods grouped by functionality in appropriate API classes
2. Maintain separation between API interfaces and model definitions
3. Follow consistent file naming conventions
4. Group related models in the same directory

## Learned Best Practices

1. Start with reviewing the API documentation before implementing
2. Verify model structures match the API specification exactly
3. Include examples where they add clarity
4. Document both success and error scenarios
5. Keep documentation focused and avoid redundancy
6. Use consistent terminology throughout
7. Break documentation into logical sections for readability
8. Consider context window limitations when documenting large APIs
   - Start new chat sessions when switching major sections
   - Reference this instruction file for consistency

## Testing Considerations

1. Ensure all documented functionality has corresponding tests
2. Test both successful and error scenarios
3. Verify documentation stays in sync with implementation
4. Test any example code provided in documentation

## Maintenance Guidelines

1. Update documentation when API changes
2. Review documentation periodically for accuracy
3. Keep examples up to date
4. Remove deprecated functionality
5. Maintain version history where relevant

## Documentation Review Checklist

- [ ] All required sections are present
- [ ] Documentation matches implementation
- [ ] Headers are correctly specified
- [ ] Parameters are fully documented
- [ ] Return values are clearly described
- [ ] Error scenarios are covered
- [ ] Examples are accurate and helpful
- [ ] Units of measurement are specified
- [ ] Constraints are documented
- [ ] Language is clear and consistent 