from pathlib import Path
p = Path("./") # destination_dir = './' in original post
files = [x.name for x in p.iterdir() if x.is_file()]
print(files[1][-3:])
files = filter(lambda f: f[-4:] == ".nix", files)

for file in files:
    f = Path(file)
    print(f"Converting {f.stem}.nix to dendretic...")
    original: str = f.read_text()
    # Remove trailing newlines
    if original[-1:] == "\n":
        origional = original[:-1]
        
    f.write_text("{ self, inputs, ... }: {\nflake.nixosModules." + f.stem + " = " + original + ";\n}")

