import csv
import os
import re

def convert_md_to_csv(md_file, csv_file, start_line=1, replacer=';'):
    try:
        # Get the directory of the current script
        script_dir = os.path.dirname(os.path.abspath(__file__))

        # Construct full paths using relative paths
        md_file_path = os.path.join(script_dir, md_file)
        csv_file_path = os.path.join(script_dir, csv_file)
        with open(md_file_path, 'r', encoding='utf-8') as md:
            lines = md.readlines()

        # Skip lines before the start_line
        data_lines = lines[start_line - 1:]

        # Parse the markdown table into rows
        rows = []
        for line in data_lines:
            # Skip separator lines (e.g., "|---|---|")
            if line.strip().startswith('|') and '-' not in line:
                # Split the line into columns and strip whitespace
                row = [col.strip().replace(',', replacer) for col in line.strip('|').split('|')]
                # Extract URLs from Markdown-style links
                row = [re.sub(r'\[.*?\]\((.*?)\)', r'\1', cell) for cell in row]
                rows.append(row)

        # Write the rows to a CSV file
        with open(csv_file_path, 'w', newline='', encoding='utf-8') as csv_out:
            writer = csv.writer(csv_out)
            writer.writerows(rows)

        print(f"Conversion complete. CSV saved to {csv_file}")
    except Exception as e:
        print(f"An error occurred: {e}")

# Example usage
convert_md_to_csv('BOM.md', 'BOM.csv', start_line=4)