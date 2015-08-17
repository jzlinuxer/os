#include <sys/types.h>  /* unistd.h need this */
#include <unistd.h>     /* contains read/write */
#include <fcntl.h>

/**
 * Copy code to the first sector of the floppy disk.
 */
int main() {
    char boot_buf[512];
    int floppy_desc, file_desc;

    // open the file boot in read-only mode
    file_desc = open("./boot", O_RDONLY);
    // copy the file descripter of the opened file to variable file_desc
    // read from the file 510 characters or until the file ends
    read(file_desc, boot_buf, 510);
    close(file_desc);

    // a bootable device should have the values 0x55 and 0xaa at the 510th and the 511th location
    boot_buf[510] = 0x55;
    boot_buf[511] = 0xaa;

    floppy_desc = open("/dev/fd0", O_RDWR);
    lseek(floppy_desc, 0, SEEK_CUR);
    write(floppy_desc, boot_buf, 512);
    close(floppy_desc);
}
