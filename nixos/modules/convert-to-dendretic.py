from pathlib import Path
p = Path("./") # destination_dir = './' in original post
files = [x.name for x in p.iterdir() if x.is_file()]
files = filter(lambda f: f[-3:] == ".nix")

for file in files:
    with 
print(files)
