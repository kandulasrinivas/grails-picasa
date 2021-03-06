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

import org.slf4j.LoggerFactory

/**
 * Registered as a bean in the application context and used to monitor
 * all registered sessions.
 *
 * @author Anthony Campbell (anthonycampbell.co.uk)
 */
class SessionMonitor implements SessionLifecycle {

    /** Logger */
	private static final log = LoggerFactory.getLogger(SessionMonitor.class)

    /** List to hold all the registered sessions */
	private def sessions = [].asSynchronized()

    @Override
    void sessionCreated(final HttpSession session) {
		if (log.debugEnabled) {
			log.debug "Registering session ${session.getId()}"
		}

        // Add session to list
		sessions << session
    }

    @Override
    void sessionDestroyed(final HttpSession session) {
		if (log.debugEnabled) {
			log.debug "Registering session ${session.getId()}"
		}

        // Remove session from list
		sessions.remove(session)
    }

    /**
     * Return the current list of sessions.
     *
     * @return current list of sessions.
     */
    def getSessions() {
        sessions
    }
}
