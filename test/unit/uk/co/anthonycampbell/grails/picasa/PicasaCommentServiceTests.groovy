package uk.co.anthonycampbell.grails.picasa

/**
 * Copyright 2010 Anthony Campbell (anthonycampbell.co.uk)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import grails.test.*

/**
 * Set of unit tests for the Picasa comment service tests.
 *
 * @author Anthony Campbell (anthonycampbell.co.uk)
 */
class PicasaCommentServiceTests extends GrailsUnitTestCase {

    // Declare test properties
    PicasaCommentService picasaCommentService

    // Declare test values
    def final TEST_

    /**
     * Set up the test suite.
     */
    protected void setUp() {
        super.setUp()

        // Initialise locking
        mockLogging(PicasaCommentService, true)

        // Initialise service
        picasaCommentService = PicasaCommentService.newInstance()
    }

    /**
     * Tear down the test suite.
     */
    protected void tearDown() {
        super.tearDown()
    }

    /**
     * Unit test for the {@link PicasaCommentService#connect} method.
     */
    void testConnect() {
        //picasaCommentService
    }
}
