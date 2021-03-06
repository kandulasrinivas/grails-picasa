package uk.co.anthonycampbell.grails.picasa

/**
 * Picasa Service Exception.
 *
 * Checked exception used to wrap exceptions thrown by the Picasa Service.
 *
 * @author Anthony Campbell (anthonycampbell.co.uk)
 */
class PicasaServiceException extends Exception {

    // Declare exception properties
    final String message

    /**
     * Constructor.
     *
     * @param message the exception message.
     */
    public PicasaServiceException(final String message) {
        super(message)
        this.message = message
    }

    /**
     * Constructor.
     *
     * @param message the exception message.
     * @param exception the wrapped exception.
     */
    public PicasaServiceException(final String message, final Exception exception) {
        super(message, exception)
        this.message = message
    }

    /**
     * Return the exception error message.
     *
     * @return the exception error message.
     */
    public String getMessage() {
       return this.message
    }
}