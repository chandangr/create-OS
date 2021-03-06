setUpSimplePaging:
    	mov edi, 0x1000    ; Set the destination index to 0x1000.
    	mov cr3, edi       ; Set control register 3 to the destination index.
    	mov DWORD [edi], 0x2003      ; Set the uint32_t at the destination index to 0x2003.
    	add edi, 0x1000              ; Add 0x1000 to the destination index.
    	mov DWORD [edi], 0x3003      ; Set the uint32_t at the destination index to 0x3003.
    	add edi, 0x1000              ; Add 0x1000 to the destination index.
    	mov DWORD [edi], 0x4003      ; Set the uint32_t at the destination index to 0x4003.
    	add edi, 0x1000              ; Add 0x1000 to the destination index.

    	mov ebx, 0x00000003          ; Set the B-register to 0x00000003.
    	mov ecx, 512                 ; Set the C-register to 512.

	.SetEntry:
    		mov DWORD [edi], ebx         ; Set the uint32_t at the destination index to the B-register.
    		add ebx, 0x1000              ; Add 0x1000 to the B-register.
    		add edi, 8                   ; Add eight to the destination index.
    		loop .SetEntry               ; Set the next entry.

    	mov eax, cr4                 ; Set the A-register to control register 4.
    	or eax, 1 << 5               ; Set the PAE-bit, which is the 6th bit (bit 5).
    	mov cr4, eax                 ; Set control register 4 to the A-register.

    	mov ecx, 0xC0000080          ; Set the C-register to 0xC0000080, which is the EFER MSR.
    	rdmsr                        ; Read from the model-specific register.
    	or eax, 1 << 8               ; Set the LM-bit which is the 9th bit (bit 8).
    	wrmsr                        ; Write to the model-specific register.


    	mov eax, cr0                 ; Set the A-register to control register 0.
    	or eax, 1 << 31 | 1 << 0     ; Set the PG-bit, which is the 31nd bit, and the PM-bit, which is the 0th bit.
    	mov cr0, eax                 ; Set control register 0 to the A-register.
ret
