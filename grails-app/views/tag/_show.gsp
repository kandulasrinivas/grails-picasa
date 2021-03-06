<%@ page import="uk.co.anthonycampbell.grails.picasa.Photo" %>
                    <div id="showTag">
					<g:if test="${flash.message}">
						<div id="flashMessage">${flash.message}</div>
					</g:if>
						<table>
							<thead>
								<tr>
                                    <th><g:message code="uk.co.anthonycampbell.grails.picasa.Photo.photoId.label" default="Photo Id" /></th>

                                    <g:remoteSortableColumn action="ajaxShow" update="showTag" id="${tagKeyword}" property="title" title="${message(code: 'uk.co.anthonycampbell.grails.picasa.Photo.title.label', default: 'Title')}" />

                                    <g:remoteSortableColumn action="ajaxShow" update="showTag" id="${tagKeyword}" property="description" title="${message(code: 'uk.co.anthonycampbell.grails.picasa.Photo.description.label', default: 'Description')}" />

                                    <th><g:message code="uk.co.anthonycampbell.grails.picasa.Photo.image.label" default="Image" /></th>

                                    <g:remoteSortableColumn action="ajaxShow" update="showTag" id="${tagKeyword}" property="cameraModel" title="${message(code: 'uk.co.anthonycampbell.grails.picasa.Photo.cameraModel.label', default: 'Camera Model')}" />

                                    <th><g:message code="uk.co.anthonycampbell.grails.picasa.Photo.geoLocation.label" default="Geo Location" /></th>

                                    <g:remoteSortableColumn action="ajaxShow" update="showTag" id="${tagKeyword}" property="dateCreated" title="${message(code: 'uk.co.anthonycampbell.grails.picasa.Photo.dateCreated.label', default: 'Date Created')}" />
								</tr>
							</thead>
							<tbody>

							<g:each in="${photoInstanceList}" status="i" var="photoInstance">
								<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                    <td><a href="${createLink(controller: "photo", action: "show", id: photoInstance.albumId)}/${photoInstance.photoId}">${fieldValue(bean: photoInstance, field: "photoId")}</a></td>

                                    <td>${fieldValue(bean: photoInstance, field: "title")}</td>

                                    <td>${fieldValue(bean: photoInstance, field: "description")}</td>

                                    <td><a href="${createLink(controller: "photo", action: "show", id: photoInstance.albumId)}/${photoInstance.photoId}"><img src="${fieldValue(bean: photoInstance, field: "thumbnailImage")}" width="${fieldValue(bean: photoInstance, field: "thumbnailWidth")}" height="${fieldValue(bean: photoInstance, field: "thumbnailHeight")}" alt="${fieldValue(bean: photoInstance, field: "title")}" title="${fieldValue(bean: photoInstance, field: "title")}"></a></td>

                                    <td>${fieldValue(bean: photoInstance, field: "cameraModel")}</td>

                                    <td>${photoInstance?.geoLocation?.latitude}${(photoInstance?.geoLocation?.longitude) ? ', ' + photoInstance.geoLocation.longitude + '' : ''}</td>

                                    <td>${(photoInstance.dateCreated)?.format("yyyy-MM-dd")}</td>
								</tr>
							</g:each>
							</tbody>
						</table>

                        <div id="contentFooter">
                            <div id="pagination">
                                <g:remotePaginate action="ajaxShow" update="showTag" id="${tagKeyword}" max="${(grailsApplication?.config?.picasa?.max) ? grailsApplication?.config?.picasa?.max : 10}" maxsteps="${grailsApplication?.config?.picasa?.maxSteps ?: 10}" total="${photoInstanceTotal}" />
                            </div>
                            <div id="feeds">
                                <a href="${createLink(action: 'show', id: tagKeyword)}/feed/rss">RSS</a> |
                                <a href="${createLink(action: 'show', id: tagKeyword)}/feed/xml">XML</a> |
                                <a href="${createLink(action: 'show', id: tagKeyword)}/feed/json">JSON</a>
                            </div>
                            <div class="cleaner"></div>
                        </div>
					</div>
