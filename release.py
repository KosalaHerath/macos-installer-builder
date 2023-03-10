import boto3
import argparse
import os
import subprocess

# CLI example
# python3 release.py --version 1.0.0

BUCKET_NAME = 'fibula-installer'

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--version", help="version of the release")
    args = parser.parse_args()

    # build the mac installer
    subprocess.run(['./macOs-x64/build-macos-x64.sh', 'femr', args.version], input=b'N', check=True)

    s3 = boto3.client('s3')

    s3.upload_file(
        f'macOS-x64/target/pkg/femr-macos-installer-x64-{args.version}.pkg', 
        BUCKET_NAME, 
        f'{args.version}/femr-x64-{args.version}.pkg'
    )

    
if __name__ == "__main__":
    main()

