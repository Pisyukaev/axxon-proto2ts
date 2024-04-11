# Axxon proto to ts converter

This is a simple tool to convert Axxon proto files to typescript interfaces.

> [!IMPORTANT]  
> We must have `protoc` installed in our system to use this tool.
> If you don't have it installed, you can install it by following the instructions [here](https://grpc.io/docs/protoc-installation/).


## Installation

Clone the repository

```bash
git clone https://github.com/Pisyukaev/axxon-proto2ts.git
```

Install the dependencies

```bash
cd axxon-proto2ts
pnpm install
```

Install `protoc` if you don't have it installed in your system. You can install it by following the instructions [here](https://grpc.io/docs/protoc-installation/).

## Usage

Move all proto files/folders with proto to the `proto` directory
Run the following command to convert the proto files to typescript interfaces

```bash
pnpm start ts:gen
```

The generated typescript interfaces will be saved in the `types` directory

> [!NOTE]
> The generated typescript interfaces may need some manual adjustments to work properly.

## Example

### Input

```protobuf /proto/example.proto
syntax = "proto3";
package docs;

message User {
  string first_name = 1;
  string last_name = 2;
  bool active = 3;
  User manager = 4;
  repeated string locations = 5;
  map<string, string> projects = 6;
}

```

### Output

```typescript /types/example.ts
/* eslint-disable */

export const protobufPackage = "docs";

export interface User {
  first_name: string;
  last_name: string;
  active: boolean;
  manager: User | undefined;
  locations: string[];
  projects: { [key: string]: string };
}

export interface User_ProjectsEntry {
  key: string;
  value: string;
}
```

## License

MIT