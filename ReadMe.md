# React Component Blueprint

A command line helper to generate typed react components.

npm install --save-dev react-component-blueprint

## Create component (Camelcase names)
The tool will automatically camelerize the component's name
```bash
 npx create spinner
 # output
 src/components/
    Spinner/
      - index.ts
      - Spinner.tsx
      - Spinner.css
      - Spinner.test.tsx
      - Spinner.stories.tsx
```

## Creata multiple components
```bash
 npx create Input Numeric Other
 # output
 src/components/
    Input/
      - index.ts
      - Input.tsx
      - Input.css
      - Input.test.tsx
      - Input.stories.tsx

    Numeric/
      - index.ts
      - Numeric.tsx
      - Numeric.css
      - Numeric.test.tsx
      - Numeric.stories.tsx

    Other/
      - index.ts
      - Other.tsx
      - Other.css
      - Other.test.tsx
      - Other.stories.tsx
```

## Delete component
```bash
npx delete Input
# delete multiple
npx delete Input Button Other
```

## Rename
```bash
npx rename Input CustomInput
# before
src/components/
  Input/
    - index.ts
    - Input.tsx
    - Input.css
    - Input.test.tsx
    - Input.stories.tsx

# result
src/components/
  CustomInput/
    - CustomInput.ts
    - CustomInput.tsx
    - CustomInput.css
    - CustomInput.test.tsx
    - CustomInput.stories.tsx
```

## Resources
[https://blog.developer.atlassian.com/scripting-with-node/](https://blog.developer.atlassian.com/scripting-with-node/9)
