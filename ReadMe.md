# React Component Blueprint

A command line helper to generate typed react components.

## Usage 
```bash
npm install --save-dev react-component-blueprint
```

### Create component (Camelcase names)
The tool will automatically camelerize the component's name
```bash
 npx create-component spinner
 # output
 src/components/
    Spinner/
      - index.ts
      - Spinner.tsx
      - Spinner.css
      - Spinner.test.tsx
      - Spinner.stories.tsx
```

### Creata multiple components
```bash
 npx create-component Input Numeric
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
```

### Delete component
```bash
npx delete-component Input
# delete multiple
npx delete-component Input Button Other
```

### Rename a component
```bash
npx rename-component Input CustomInput
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

## Contribution
```bash
git clone git+https://github.com/fabrigeas/react-component-blueprint.git
cd react-component-blueprint
git checkout -b feature/your-feature-name
# make changes and commit
git push origin feature/your-feature-name
# create merge request
```

Deployment and publishing the npm package
```bash
grunt publish:minor # update the minor npm version and publish
grunt publish:major # update the major npm version and publish
grunt publish:patch # update the patch npm version and publish
grunt publish # is equivalent to grunt publish:patch
```

## Resources
[https://blog.developer.atlassian.com/scripting-with-node/](https://blog.developer.atlassian.com/scripting-with-node/9)
