package uk.co.anthonycampbell.grails.picasa.session

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

import javax.servlet.http.HttpSession

/**
 * Interface provides methods called by the SessionLifecycleListener.
 *
 * @author Anthony Campbell (anthonycampbell.co.uk)
 */
interface SessionLifecycle {

    /**
     * Session created
     *
     * @param the session which has just been created.
     */
    void sessionCreated(HttpSession session)

    /**
     * Session destroyed
     *
     * @param the session which has just been destroyed.
     */
    void sessionDestroyed(HttpSession session)
}

