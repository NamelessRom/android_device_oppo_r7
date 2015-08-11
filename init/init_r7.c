/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#define PROC_OPPO_OPERATOR_NAME "/proc/oppoVersion/operatorName"

void vendor_load_properties() {
    int international = 0;
    char buf[1] = "0";
    int fd = -1;

    fd = open(PROC_OPPO_OPERATOR_NAME, O_RDONLY);
    if ((fd >= 0) && (read(fd, buf, 1) == 1)) {
        if (atoi(buf) == 5) {
            international = 1;
        }
    }
    close(fd);

    ERROR("libinit_r7: international=%d\n", international);

    if (international) {
        property_set("ro.build.product", "r7f");
        property_set("ro.product.model", "r7f");
        property_set("ro.product.name",  "r7f");
    } else {
        // TODO: revisit
        property_set("ro.build.product", "r7");
        property_set("ro.product.model", "r7");
        property_set("ro.product.name",  "r7");
    }
}
