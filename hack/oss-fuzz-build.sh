#!/bin/bash -eu

# SPDX-FileCopyrightText: Copyright The Lima Authors
# SPDX-License-Identifier: Apache-2.0

# This script is used by OSS-Fuzz to build and run Limas fuzz tests continuously.
# Limas OSS-Fuzz integration can be found here: https://github.com/google/oss-fuzz/tree/master/projects/lima
# Modify https://github.com/google/oss-fuzz/blob/master/projects/lima/project.yaml for access management to Limas OSS-Fuzz crashes.
printf "package store\nimport _ \"github.com/AdamKorcz/go-118-fuzz-build/testing\"\n" >"$SRC"/lima/pkg/store/register.go
go mod tidy
compile_native_go_fuzzer github.com/lima-vm/lima/v2/pkg/store FuzzLoadYAMLByFilePath FuzzLoadYAMLByFilePath
compile_native_go_fuzzer github.com/lima-vm/lima/v2/pkg/store FuzzInspect FuzzInspect
compile_native_go_fuzzer github.com/lima-vm/lima/v2/pkg/nativeimgutil FuzzConvertToRaw FuzzConvertToRaw
compile_native_go_fuzzer github.com/lima-vm/lima/v2/pkg/cidata FuzzSetupEnv FuzzSetupEnv
compile_native_go_fuzzer github.com/lima-vm/lima/v2/pkg/iso9660util FuzzIsISO9660 FuzzIsISO9660
compile_native_go_fuzzer github.com/lima-vm/lima/v2/pkg/guestagent/procnettcp FuzzParse FuzzParse
compile_native_go_fuzzer github.com/lima-vm/lima/v2/pkg/yqutil FuzzEvaluateExpression FuzzEvaluateExpression
compile_native_go_fuzzer github.com/lima-vm/lima/v2/pkg/downloader FuzzDownload FuzzDownload
