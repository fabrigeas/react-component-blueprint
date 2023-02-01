# React Component Blueprint

A command line helper to generate typed react components.

npm install --save-dev react-component-blueprint

## Examples

### Camelcase names

The tool will automatically camelerize the component's name

```bash
 create spinner


 # output
 src/components/

    Spinner/
      - Spinner.tsc
      - Spinner.css
      - Spinner.test.tsx
```

### Creata multiple components

```bash
 create Input Numeric Other
 
 # output
 src/components/
    Input/
      - Input.tsc
      - Input.css
      - Input.test.tsx
    Numeric/
      - Numeric.tsc
      - Numeric.css
      - Numeric.test.tsx
    Other/
      - Other.tsc
      - Other.css
      - Other.test.tsx
```