<%@ page import="uk.co.anthonycampbell.grails.picasa.Photo" %>
                    <div id="listPhoto">
					<g:if test="${flash.message}">
						<div id="flashMessage">${flash.message}</div>
					</g:if>
                    <g:if test="${grailsApplication?.config?.picasa?.useGridListing ?: false}">
					    <g:each in="${photoInstanceList}" status="i" var="photoInstance">
                            <div class="photo">
                                <p><a href="${createLink(controller: "photo", action: "show", id: photoInstance.albumId)}/${photoInstance.photoId}"><img
                                      src="${fieldValue(bean: photoInstance, field: "thumbnailImage")}"
                                      width="${fieldValue(bean: photoInstance, field: "thumbnailWidth")}"
                                      height="${fieldValue(bean: photoInstance, field: "thumbnailHeight")}"
                                      alt="${fieldValue(bean: photoInstance, field: "title")}"
                                      title="${fieldValue(bean: photoInstance, field: "title")}" /></a></p>
                            </div>
					    </g:each>
					</g:if>
					<g:else>
						<table>
							<thead>
								<tr>
                                    <th><g:message code="uk.co.anthonycampbell.grails.picasa.Photo.photoId.label" default="Photo Id" /></th>

                                    <g:remoteSortableColumn action="ajaxList" update="listPhoto" property="title" title="${message(code: 'uk.co.anthonycampbell.grails.picasa.Photo.title.label', default: 'Title')}" />

                                    <g:remoteSortableColumn action="ajaxList" update="listPhoto" property="description" title="${message(code: 'uk.co.anthonycampbell.grails.picasa.Photo.description.label', default: 'Description')}" />

                                    <th><g:message code="uk.co.anthonycampbell.grails.picasa.Photo.image.label" default="Image" /></th>

                                    <g:remoteSortableColumn action="ajaxList" update="listPhoto" property="cameraModel" title="${message(code: 'uk.co.anthonycampbell.grails.picasa.Photo.cameraModel.label', default: 'Camera Model')}" />

                                    <th><g:message code="uk.co.anthonycampbell.grails.picasa.Photo.geoLocation.label" default="Geo Location" /></th>

                                    <g:remoteSortableColumn action="ajaxList" update="listPhoto" property="dateCreated" title="${message(code: 'uk.co.anthonycampbell.grails.picasa.Photo.dateCreated.label', default: 'Date Created')}" />
								</tr>
							</thead>
							<tbody>

							<g:each in="${photoInstanceList}" status="i" var="photoInstance">
								<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                    <td><a href="${createLink(controller: "photo", action: "show", id: photoInstance.albumId)}/${photoInstance.photoId}">${fieldValue(bean: photoInstance, field: "photoId")}</a></td>

                                    <td>${fieldValue(bean: photoInstance, field: "title")}</td>

                                    <td>${fieldValue(bean: photoInstance, field: "description")}</td>

                                    <td><a href="${createLink(controller: "photo", action: "show", id: photoInstance.albumId)}/${photoInstance.photoId}"><img src="${fieldValue(bean: photoInstance, field: "thumbnailImage")}" width="${fieldValue(bean: photoInstance, field: "thumbnailWidth")}" height="${fieldValue(bean: photoInstance, field: "thumbnailHeight")}" alt="${fieldValue(bean: photoInstance, field: "title")}" title="${fieldValue(bean: photoInstance, field: "title")}" /></a></td>

                                    <td>${fieldValue(bean: photoInstance, field: "cameraModel")}</td>

                                    <td>${photoInstance?.geoLocation?.latitude}${(photoInstance?.geoLocation?.longitude) ? ', ' + photoInstance.geoLocation.longitude + '' : ''}</td>

                                    <td>${(photoInstance.dateCreated)?.format("yyyy-MM-dd")}</td>
								</tr>
							</g:each>
							</tbody>
						</table>
					</g:else>
                      
                        <div id="contentFooter">
                            <div id="pagination">
                                <g:remotePaginate action="ajaxList" update="listPhoto" albumId="${albumId}" max="${(grailsApplication?.config?.picasa?.max) ? grailsApplication?.config?.picasa?.max : 10}" maxsteps="${(grailsApplication?.config?.picasa?.maxSteps) ? grailsApplication?.config?.picasa?.maxSteps : 10}" total="${photoInstanceTotal}" />
                            </div>
                            <div id="feeds">
                                <a href="${createLink(action: 'list')}/${albumId}/feed/rss">RSS</a> |
                                <a href="${createLink(action: 'list')}/${albumId}/feed/xml">XML</a> |
                                <a href="${createLink(action: 'list')}/${albumId}/feed/json">JSON</a>
                            </div>
                            <div class="cleaner"></div>
                        </div>
					</div>
