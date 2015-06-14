SECTIONS
{
    . = 0x7c00;
    .text :
    {
        _ftext = .; /* program will load to 0x7c00 */
    } = 0
}
