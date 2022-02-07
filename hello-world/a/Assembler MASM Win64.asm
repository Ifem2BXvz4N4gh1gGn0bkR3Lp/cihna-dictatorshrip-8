; ---------------------------------------------
; Hello World for Win64 Intel x64 Assembly
;
; by fruel (https://github.com/fruel)
; 13 June 2016
; ---------------------------------------------

GetStdHandle PROTO
ExitProcess PROTO
WriteConsoleA PROTO

.data
msg BYTE "Hello World!",0
bytesWritten DWORD ?

.code
main PROC
    sub rsp, 5 * 8              ; reserve shadow space

    mov rcx, -11                ; nStdHandle (STD_OUTPUT_HANDLE)
    call GetStdHandle

    mov  rcx, rax               ; hConsoleOutput
    lea  rdx, msg               ; *lpBuffer
    mov  r8, LENGTHOF msg - 1   ; nNumberOfCharsToWrite
    lea  r9, bytesWritten       ; lpNumberOfCharsWritten
    mov  QWORD PTR [rsp + 4 * SIZEOF QWORD], 0  ; lpReserved
    call WriteConsoleA

    mov rcx, 0                  ; uExitCode
    call ExitProcess
main ENDP
END
