
package domain;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;

@Entity
@Access(AccessType.PROPERTY)
public class Segment extends DomainEntity {

	private Date			originTime;
	private Date			destinationTime;

	//Relational attributes
	private Collection<GPS>	gps;


	@Temporal(TemporalType.TIMESTAMP)
	//@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	public Date getOriginTime() {
		return this.originTime;
	}

	public void setOriginTime(final Date originTime) {
		this.originTime = originTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	//@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	public Date getDestinationTime() {
		return this.destinationTime;
	}

	public void setDestinationTime(final Date destinationTime) {
		this.destinationTime = destinationTime;
	}

	@Valid
	@ManyToMany
	public Collection<GPS> getGps() {
		return this.gps;
	}

	public void setGps(final Collection<GPS> gps) {
		this.gps = gps;
	}

}