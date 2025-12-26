# File Path Generator

A Bash script to recursively generate a list of all files in a directory and save the result to `files.json`.  
Common build/cache directories like `node_modules`, `build`, and `.cache` are automatically skipped.

## Usage

### Run
```bash
curl -s https://raw.githubusercontent.com/dicodingacademy/file-path-generator/refs/heads/main/exec.sh | bash -s -- .
```

## Skipped Directories

These directories are ignored by default:

- `node_modules`, `.npm`, `.yarn`, `.pnpm-store`
- `build`, `dist`, `.build`, `.dist`, `out`, `.output`
- `.next`, `.nuxt`, `.svelte-kit`, `.vite`, `.angular`
- `cache`, `.cache`, `.parcel-cache`, `.turbo`, `.gradle`
- `vendor`, `target`, `bin`, `obj`, `.cargo`
- `.github`, `.gitlab`, `.terraform`, `.git`

> The full list can be found in the `SKIP_DIRS` array within the script.

## Example Output

`files.json` structure:
```json
[
  "src/index.js",
  "public/favicon.ico",
  "app/config/settings.json"
]
```

## Customization

Add more skip directories by editing the script:

```bash
SKIP_DIRS+=( "folder-name" )
```

## FAQ

**Q:** Is this only for JavaScript/Node projects?  
**A:** No. It works for any project or directory structure.

**Q:** Do I need sudo?  
**A:** Only if you need access to restricted directories.

## 📄 License

Feel free to use, modify, and distribute this script as you wish.
