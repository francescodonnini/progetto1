import os

def count_lines_in_directory(directory="."):
    s = 0
    for filename in os.listdir(directory):
        filepath = os.path.join(directory, filename)
        if os.path.isfile(filepath) and '.csv' in filename:
            try:
                with open(filepath, 'r', encoding='utf-8') as f:
                    s += len(f.readlines()[1:])
                print(f"{filename}: {line_count} lines")
            except Exception as e:
                print(f"Error processing {filename}: {e}")
    return s

if __name__ == "__main__":
    print(count_lines_in_directory())

